import { ref, Ref } from "@vue/composition-api";

export class Loader {
  loading = ref(false);

  load = (loading: Ref<boolean>, waitingFor: () => void) => {
    loading.value = true;
    waitingFor();
    loading.value = false;
  };
}

export const useLoader = () => {
  const loader = new Loader();
  return loader;
};
