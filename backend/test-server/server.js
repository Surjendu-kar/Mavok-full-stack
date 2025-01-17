import {
  createDirectus,
  readItem,
  rest,
  updateItem,
  login,
  staticToken,
} from "@directus/sdk";

const client = createDirectus("http://localhost:8055").with(rest());

const getProducts = async () => {
  try {
    const products = await client.request(readItem("accessories", "84"));
    console.log("products", products);
  } catch (error) {
    console.log("error", error);
  }
};

const updateProduct = async () => {
  // login and get token
  // const token = await client.request(login("admin@example.com", "1234"));

  const partialItemObject = {
    heading: "Updated Product 2",
  };

  try {
    const products = await client.request(
      updateItem("accessories", "84", partialItemObject, {
        access_token: 'L3m9W5d1Re27esMOwbPpGnaPUDspmtRD',
      })
    );
    console.log("products", products);
  } catch (error) {
    console.log("error", error);
  }
};

updateProduct();
