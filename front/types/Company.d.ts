import { Art } from "./Art";
import { Culture } from "./Culture";
import { Athletic } from "./Athletic";
import { Keyword } from "./Keyword";

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
  keyword: Keyword;
};

export type CompaniesResponse = {
  companies: Company[];
};

export type CompanyIndexParams = {
  companyCategory: string | null;
  athleticId: number | null;
  cultureId: number | null;
  artId: number | null;
  // keyword: string | null;
};
