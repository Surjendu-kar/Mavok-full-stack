import { defineHook } from "@directus/extensions-sdk";

export default defineHook(({ action }) => {
  // Handle item creation
  action("items.create", async (meta) => {
    if (meta.collection === "accessories") {
      const accessoryData = {
        id: meta.key,
        type_id: meta.payload.type,
        thumbnail: meta.payload.main_image,
        images:
          meta.payload.additional_images?.create?.map(
            (img: { directus_files_id: { id: number } }) =>
              img.directus_files_id.id
          ) || [],
        title: meta.payload.heading,
        subtitle: meta.payload.sub_heading,
        price: meta.payload.price,
        options: meta.payload.options || [],
      };

      console.log(
        "Prepared Accessory Data for Medusa:",
        JSON.stringify(accessoryData, null, 2)
      );

      // Here i would add my Medusa sync logic
      try {
        // Example of how i might sync to Medusa:
        // await syncToMedusa('create', accessoryData);
        console.log("Ready to sync to Medusa:", accessoryData.id);
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
