// --- Gestion des onglets ---
const loginTab = document.getElementById("login-tab");
const registerTab = document.getElementById("register-tab");
const loginForm = document.getElementById("login-form");
const registerForm = document.getElementById("register-form");

loginTab.addEventListener("click", () => {
  loginTab.classList.add("active");
  registerTab.classList.remove("active");
  loginForm.classList.add("active");
  registerForm.classList.remove("active");
});

registerTab.addEventListener("click", () => {
  registerTab.classList.add("active");
  loginTab.classList.remove("active");
  registerForm.classList.add("active");
  loginForm.classList.remove("active");
});

// --- Simulation de login/register sans alert ---
if (loginForm) {
  loginForm.addEventListener("submit", (e) => {
    e.preventDefault();
    // Redirection directe
    window.location.href = "profile.html";
  });
}

if (registerForm) {
  registerForm.addEventListener("submit", (e) => {
    e.preventDefault();
    // Redirection directe
    window.location.href = "profile.html";
  });

}
