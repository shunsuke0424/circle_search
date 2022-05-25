type PageUrl = string;

export const routingService: {
  [key: string]: (...args: any[]) => PageUrl;
} = {
  Top: () => "/",
  CompanyDetail: (id: number) => `/companies/${id}`,
  Companies: () => "/companies",
} as const;
