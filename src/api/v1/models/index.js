const roleModel = require("./role.model");
const userModel = require("./user.model");

/* ASSOCIATION */
// User Associate
userModel.User.belongsTo(roleModel.Role, {
  foreignKey: "roleId",
});
// ========== END ==========

module.exports = {
  roleModel,
  userModel,
};
