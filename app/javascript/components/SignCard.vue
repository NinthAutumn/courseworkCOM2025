<template>
  <div class="signup-card">
    <form @submit.prevent="loginHandler">
      <card-style class="signup-card__form">
        <h1 class="signup-card__title">Signup</h1>
        <label for>Username</label>
        <input
          v-model="form.username"
          placeholder="Username"
          class="input"
          maxlength="100"
          type="text"
          required
        />
        <label for>Email</label>
        <input
          v-model="form.email"
          placeholder="Email"
          maxlength="100"
          required
          class="input"
          type="text"
        />
        <label for>Password</label>
        <input
          class="input"
          required
          type="password"
          v-model="form.password"
          maxlength="100"
          placeholder="Password"
        />
        <label for>Confirm Password</label>
        <input
          class="input"
          type="password"
          required
          maxlength="100"
          v-model="form.c_password"
          placeholder="Confirm Password"
        />
        <span class="error" v-if="error">{{ error }}</span>
        <div class="flex-divider">
          <button class="button button--primary button--round" type="submit">
            Sign Up
          </button>
          <!-- <button-card type="submit" style="margin-left: auto"
            >Login</button-card -->
        </div>
      </card-style>
    </form>
  </div>
</template>
<script >
export default {
  data: () => ({
    form: {
      username: "",
      email: "",
      password: "",
      c_password: "",
    },
    error: false,
  }),
  methods: {
    async loginHandler(e) {
      //validate if the password === confirm_password
      if (this.form.password !== this.form.c_password) {
        alert("Password confirmation must be the same with password");
        return (this.error =
          "Password confirmation must be the same with password");
      }
      const { error } = await this.$store.dispatch("user/signup", this.form);
      //check if there was any error
      if (error) return (this.error = error);
      //direct user to home after success
      return this.$router.push("/");
    },
  },
  components: {
    CardStyle: () => import("./Style/Card.vue"),
    InputStyle: () => import("./Style/Input.vue"),
  },
};
</script>
<style lang="scss">
.signup-card {
  label {
    margin-bottom: 1rem;
  }

  &__form {
    margin-top: 1rem;
    @media screen and (min-width: 700px) {
      max-width: 80rem;
      margin: 0 auto;
    }
  }
  &__title {
    margin: 1rem 0;
    text-align: center;
  }
  .flex-divider {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    margin: 1rem 0;
  }
  &__password-forgot {
    margin: 2rem 0;
    text-align: center;
    font-size: 1.2rem;
    // width: 100%;
  }
}
</style>
