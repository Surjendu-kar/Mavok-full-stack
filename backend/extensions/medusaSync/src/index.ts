import { defineHook } from "@directus/extensions-sdk";

const apiKeyToken =
  "sk_978b150c6c2b3bfc7b95041230356448aebb984fef6678a6988e91f4dac5c2cc";

export default defineHook(({ action }) => {
  // Handle item creation
  action("items.create", async (meta) => {
    if (meta.collection === "accessories") {
      const accessoryData = {
        handle: meta.key.toString(),
        title: meta.payload.heading,
        subtitle: meta.payload.sub_heading,
        description: meta.payload.sub_heading,
        options: [
          {
            title: "Variants",
            values: meta.payload.options.map((each: any) => each.title),
          },
        ],
      };

      console.log(
        "Prepared Accessory Data for Medusa:",
        JSON.stringify(accessoryData, null, 2)
      );

      try {
        const res = await fetch(
          "http://host.docker.internal:9000/admin/products",
          {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString(
                "base64"
              )}`,
            },
            body: JSON.stringify(accessoryData),
          }
        );

        const data = await res.json();
        console.log(data);
      } catch (error) {
        console.error("Failed to sync to Medusa:", error);
      }
    }
  });

  // Handle item deletion
  action("items.delete", async (meta) => {
    if (meta.collection === "accessories") {
      for (const id of meta.keys) {
        try {
          const handle = id.toString();
          // First get the product ID from Medusa using handle
          const productRes = await fetch(
            `http://host.docker.internal:9000/admin/products?handle=${handle}`,
            {
              headers: {
                Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString(
                  "base64"
                )}`,
              },
            }
          );

          const products = await productRes.json();
          if (!products.products || !products.products.length) {
            throw new Error(`No product found with handle ${handle}`);
          }

          const medusaProductId = products.products[0].id;

          // Delete using Medusa product ID
          const deleteRes = await fetch(
            `http://host.docker.internal:9000/admin/products/${medusaProductId}`,
            {
              method: "DELETE",
              headers: {
                Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString(
                  "base64"
                )}`,
              },
            }
          );

          if (!deleteRes.ok) {
            throw new Error(`Failed to delete product ${medusaProductId}`);
          }

          console.log(`Successfully deleted product ${handle} from Medusa`);
        } catch (error) {
          console.error(`Error deleting product:`, error);
        }
      }
    }
  });

  // Handle item updates
  action("items.update", async (meta) => {
    if (meta.collection === "accessories") {
      for (const id of meta.keys) {
        try {
          const handle = id.toString();
          // Get Medusa product ID
          const productRes = await fetch(
            `http://host.docker.internal:9000/admin/products?handle=${handle}`,
            {
              headers: {
                Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString(
                  "base64"
                )}`,
              },
            }
          );

          const products = await productRes.json();
          if (!products.products?.length) {
            throw new Error(`No product found with handle ${handle}`);
          }

          const medusaProductId = products.products[0].id;

          // Update product in Medusa
          const updateData = {
            title: meta.payload.heading,
            subtitle: meta.payload.sub_heading,
            description: meta.payload.sub_heading,
            options: [
              {
                title: "Variants",
                values:
                  meta.payload.options?.map((each: any) => each.title) || [],
              },
            ],
          };

          const updateRes = await fetch(
            `http://host.docker.internal:9000/admin/products/${medusaProductId}`,
            {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString(
                  "base64"
                )}`,
              },
              body: JSON.stringify(updateData),
            }
          );

          if (!updateRes.ok) {
            throw new Error(`Failed to update product ${medusaProductId}`);
          }

          console.log(`Successfully updated product ${handle} in Medusa`);
        } catch (error) {
          console.error(`Error updating product:`, error);
        }
      }
    }
  });
});
