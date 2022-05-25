/** @type {import('vls').VeturConfig} */
module.exports = {
  projects: [
    "./front",
    {
      root: "./front",
      package: "./front/package.json",
      tsconfig: "./front/tsconfig.json",
    },
  ],
};
