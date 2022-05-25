import { Art } from "./Art";
import { Culture } from "./Culture";
import { Athletic } from "./Athletic";

export type Company = {
  id: number;
  name: string;
  number: number | null;
  detail: string | null;
  place: string | null;
  imagesPath: string | null;
  frequency: number | null;
  activityDay: string | null;
  snsLink: string | null;
  companyCategory: string | null;
  athletic: Athletic;
  art: Art;
  culture: Culture;
};

export type CompaniesResponse = {
  companies: Company[];
};
