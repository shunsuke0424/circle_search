<template>
  <v-row>
    <v-col v-if="company" class="text-center">
      <div class="title">サークル詳細画面</div>
      <div class="company-container">
        <div class="company-info-box">{{ company.company.name }}</div>
        <div class="company-info-box">{{ company.company.number }}</div>
        <div class="company-info-box">{{ company.company.detail }}</div>
        <div class="company-info-box">{{ company.company.place }}</div>
        <div class="company-info-box">
          {{ company.company.company_category }}
        </div>
      </div>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import {
  defineComponent,
  computed,
  useRoute,
  useRouter,
  onMounted,
  onUnmounted,
} from "@nuxtjs/composition-api";

import { companiesModule } from "@/store";
export default defineComponent({
  name: "CompanyDetailPage",
  setup(_props) {
    const route = useRoute();
    const router = useRouter();
    const pageId = Number(route.value.params.id);
    const { loading, load } = companiesModule.loader;
    const company = computed(() => companiesModule.company);
    onMounted(() => {
      load(loading, () => {
        companiesModule.getCompany(pageId);
      });
    });
    onUnmounted(() => {
      companiesModule.setCompany(null);
    });
    return {
      company,
      pageId,
      route,
      router,
    };
  },
  head(): object {
    return {
      title: "サークル詳細画面",
    };
  },
});
</script>
