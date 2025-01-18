import { updateProductsWorkflow } from "@medusajs/medusa/core-flows";
import { DIRECTUS_MODULE } from "../../modules/directus";

updateProductsWorkflow.hooks.productsUpdated(
  async ({ products }, { container }) => {
    console.log(products);
    // Resolve
    const directusService = container.resolve(DIRECTUS_MODULE);
    // Use the Directus service to sync the updated products to Directus
    await directusService.updateProduct(products);
  }
);
