import {
  createDirectus,
  DirectusClient,
  readItem,
  rest,
  RestClient,
  updateItem,
} from "@directus/sdk";


type Product = {
  id: string;
  handle: string;
  title: string;
  description: string;
}[];

class DirectusModuleService {
  private client: DirectusClient<{}> & RestClient<{}>;
  private authToken: string;

  constructor({ logger }, options: { url: string; token: string }) {
    this.client = createDirectus(options.url).with(rest());
    this.authToken = options.token;
  }

  async updateProduct(product: Product) {
    try {
      const singleProduct = product[0];
      const productID = singleProduct.handle;

      // Get existing product from Directus
      const existingProduct = await this.client.request(
        readItem("accessories", productID)
      );

      // If product exists, update it
      if (existingProduct) {
        // Update existing product
        const result = await this.client.request(
          updateItem(
            "accessories",
            productID,
            {
              heading: singleProduct.title,
              sub_heading: singleProduct.description,
            },
            {
              access_token: this.authToken,
            }
          )
        );
        console.log("Updated product:", result);
      }
    } catch (error) {
      console.log("error", error);
    }
  }
}

export default DirectusModuleService;
