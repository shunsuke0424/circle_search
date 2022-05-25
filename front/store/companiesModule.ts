import { Action, Module, Mutation, VuexModule } from "vuex-module-decorators";
import { $axios } from "@/store/api";
import { Company, CompaniesResponse } from "@/types/Company";
import { useLoader } from "@/services/useLoader";

@Module({
  name: "companiesModule",
  stateFactory: true,
  namespaced: true,
})
export default class CompaniesModule extends VuexModule {
  loader = useLoader();
  companies: Company[] = [];
  company: Company | null = null;

  @Mutation
  setCompanies(companies: Company[]) {
    this.companies = companies;
  }

  @Mutation
  setCompany(company: Company | null) {
    this.company = company;
  }

  @Action({ rawError: true })
  async getCompanies() {
    const res = await $axios.$get<CompaniesResponse>("/companies");
    this.setCompanies(res.companies);
  }

  @Action({ rawError: true })
  async getCompany(id: number) {
    const company = await $axios.$get<Company>(`/companies/${id}`);
    this.setCompany(company);
  }
}
