#管理者情報
@user = User.create!(
            email: "admin@example.com",
            password: "111111",
            uid: "11111111-1111-1111-1111-111111111111",
            provider: "",
            admin_flag: true
          )
Profile.create(
  nickname: "admin",
  user_id: @user.id
)
