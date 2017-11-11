
%w[admin trainer user].each { |r| Role.create(name: r) }

admin = User.create(
  email: "admin@cher.sg",
  password: "inspirethecherinyou",
  password_confirmation: "inspirethecherinyou"
)
admin.add_role :admin

kangsheng = User.create(
  email: "kangsheng@gmail.com",
  password: "password",
  password_confirmation: "password"
)
kangsheng.add_role :admin
