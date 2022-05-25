import { Plugin } from "@nuxt/types";
import { initializeAxios } from "@/store/api";

export const accessor: Plugin = ({ $axios }): void => {
  initializeAxios($axios);
};

export default accessor;
