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

      // Here i would add my Medusa sync logic
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
      console.log("Accessory deleted - IDs:", meta.keys);
      // Add Medusa deletion sync logic here
    }
  });

  // Handle item updates
  action("items.update", async (meta) => {
    if (meta.collection === "accessories") {
      console.log("Accessory updated - IDs:", meta.keys);
      console.log("Updated data:", JSON.stringify(meta.payload, null, 2));
      // Add Medusa update sync logic here
    }
  });
});
