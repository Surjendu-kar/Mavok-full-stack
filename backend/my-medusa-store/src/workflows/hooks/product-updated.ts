import { updateProductsWorkflow } from "@medusajs/medusa/core-flows";
import { DIRECTUS_MODULE } from "../../modules/directus";

updateProductsWorkflow.hooks.productsUpdated(
  async ({ products }, { container }) => {
    console.log(products);
    const directusService = container.resolve(DIRECTUS_MODULE);
    await directusService.updateProduct(products);
  }
);
