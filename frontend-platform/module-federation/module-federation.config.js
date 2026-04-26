// Module Federation across TalentBridge frontends (storefront / admin / partner / mobile-web)
const { ModuleFederationPlugin } = require("@module-federation/enhanced/webpack");
module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: "talentbridge_shell",
      remotes: {
        admin: "admin@https://admin.talentbridge.internal/remoteEntry.js",
        partner: "partner@https://partner.talentbridge.internal/remoteEntry.js",
      },
      shared: { react: { singleton: true }, "react-dom": { singleton: true } },
    }),
  ],
};
