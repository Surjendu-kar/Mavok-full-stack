import { Module } from "@medusajs/framework/utils";
import DirectusModuleService from "./service";

export const DIRECTUS_MODULE = "directus";

export default Module(DIRECTUS_MODULE, {
  service: DirectusModuleService,
});
