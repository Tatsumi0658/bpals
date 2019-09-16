#管理者情報
@user = User.create!(
            email: "admin@example.com",
            password: "111111",
            admin_flag: true
          )
Profile.create(
  nickname: "admin",
  user_id: @user.id
)
