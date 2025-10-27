// Changement de couleur du header au scroll
window.addEventListener("scroll", () => {
  const header = document.getElementById("header");
  if (window.scrollY > 20) {
    header.classList.add("scrolled");
  } else {
    header.classList.remove("scrolled");
  }
});

{
    const linkPage = link.getAttribute("href").split("/").pop();

    if (linkPage === currentPage || (currentPage === "" && linkPage.includes("#"))) {
      link.classList.add("active"); // ajoute la classe 'active'
    } else {
      link.classList.remove("active"); // supprime la classe des autres
    }
  };


// Menu mobile
const menuBtn = document.getElementById("menu-btn");
const mobileMenu = document.getElementById("mobile-menu");

menuBtn.addEventListener("click", () => {
  mobileMenu.classList.toggle("show");
  menuBtn.textContent = mobileMenu.classList.contains("show") ? "✖" : "☰";
});
// Barre de recherche
document.getElementById("search-btn").addEventListener("click", () => {
  const query = document.getElementById("search-input").value.trim();
  if (query) {
    window.location.href = `search.html?q=${encodeURIComponent(query)}`;
  }
});


// Connexion (exemple)
document.getElementById("login-btn").addEventListener("click", () => {
  window.location.href = "login.html"; // redirige vers la page de connexion
});


