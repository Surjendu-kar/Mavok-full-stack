import { defineHook } from "@directus/extensions-sdk";

interface ProductOption {
  title: string;
  values: string[];
}

interface AccessoryPayload {
  heading: string;
  sub_heading: string;
  options: ProductOption[];
}

const apiKeyToken =
  "sk_978b150c6c2b3bfc7b95041230356448aebb984fef6678a6988e91f4dac5c2cc";
const MEDUSA_BASE_URL = "http://host.docker.internal:9000/admin";

// Helper function to create authorization header
const getAuthHeader = () => ({
  Authorization: `Basic ${Buffer.from(`${apiKeyToken}:`).toString("base64")}`,
});

// Helper function for making API calls to Medusa
const medusaAPI = async (endpoint: string, options: RequestInit = {}) => {
  const response = await fetch(`${MEDUSA_BASE_URL}${endpoint}`, {
    ...options,
    headers: {
      ...options.headers,
      ...getAuthHeader(),
    },
  });

  if (!response.ok) {
    throw new Error(`Medusa API call failed: ${response.statusText}`);
  }

  return response.json();
};

// Helper function to get product by handle
const getProductByHandle = async (handle: string) => {
  const { products } = await medusaAPI(`/products?handle=${handle}`);

  if (!products?.length) {
    throw new Error(`No product found with handle ${handle}`);
  }

  return products[0];
};

// Helper function to format product data
const formatProductData = (
  payload: AccessoryPayload
): {
  title: string;
  subtitle: string;
  description: string;
  options: ProductOption[];
} => ({
  title: payload.heading,
  subtitle: payload.sub_heading,
  description: payload.sub_heading,
  options: [
    {
      title: "Variants",
      values: payload.options?.map((each) => each.title) || [],
    },
  ],
});

export default defineHook(({ action }) => {
  // Handle item creation
  action("items.create", async (meta) => {
    if (meta.collection === "accessories") {
      try {
        const accessoryData = {
          handle: meta.key.toString(),
          ...formatProductData(meta.payload),
        };

        console.log("Preparing to create product:", accessoryData);

        const data = await medusaAPI("/products", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(accessoryData),
        });

        console.log("Product created successfully:", data);
      } catch (error) {
        console.error("Failed to create product in Medusa:", error);
      }
    }
  });

  // Handle item deletion
  action("items.delete", async (meta) => {
    if (meta.collection === "accessories") {
      for (const id of meta.keys) {
        try {
          const handle = id.toString();
          const product = await getProductByHandle(handle);

          await medusaAPI(`/products/${product.id}`, {
            method: "DELETE",
          });

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
          const product = await getProductByHandle(handle);
          const updateData = formatProductData(meta.payload);

          await medusaAPI(`/products/${product.id}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(updateData),
          });

          console.log(`Successfully updated product ${handle} in Medusa`);
        } catch (error) {
          console.error(`Error updating product:`, error);
        }
      }
    }
  });
});
