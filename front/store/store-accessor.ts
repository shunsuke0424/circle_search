/* eslint-disable import/no-mutable-exports */
import { Store } from "vuex";
import { getModule } from "vuex-module-decorators";
import CompaniesModule from "@/store/companiesModule";

let companiesModule: CompaniesModule;

function initialiseStores(store: Store<any>): void {
  companiesModule = getModule(CompaniesModule, store);
}

export { initialiseStores, companiesModule };
