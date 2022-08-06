<template>
  <div class="container">
    <div class="title-header">
      <div class="title">サークル一覧はこちらです！こんな感じです！</div>
    </div>
    <div
      class="company-container"
      v-for="company in companies"
      :key="company.key"
    >
      <v-btn @click="clickCompany(company.id)"> {{ company.name }} </v-btn>
    </div>
  </div>
</template>

<script lang="ts">
import {
  computed,
  defineComponent,
  useRoute,
  useRouter,
  onMounted,
} from "@nuxtjs/composition-api";

import { companiesModule } from "@/store";
import { Company } from "@/types/Company";
import { routingService } from "@/services/routingService";

export default defineComponent({
  name: "IndexPage",
  setup(_props) {
    const router = useRouter();
    const route = useRoute();
    const { loading, load } = companiesModule.loader;
    const companies = computed(() => companiesModule.companies);
    const getPage = (page: number) => {
      companiesModule.setCompanies([]);
      companiesModule.getCompanies();
    };
    const clickCompany = (companyId: number) => {
      router.push("/companies/" + companyId);
    };
    const handleEdit = (company: Company) => {
      router.push(routingService.CompanyDetail(company.id));
    };
    onMounted(() => {
      load(loading, () => {
        companiesModule.getCompanies();
      });
    });

    return {
      loading,
      companies,
      getPage,
      handleEdit,
      clickCompany,
    };
  },
  head(): object {
    return {
      title: "サークル一覧",
    };
  },
});
</script>

<style lang="postcss" scoped>
.container > * {
  margin-bottom: var(--spacing-4);
}

.title {
  font-size: 16px;
  font-weight: bold;
}

.title-header {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}
</style>
