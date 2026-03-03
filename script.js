// =========================
// EcoTech Shop - script.js
// Simple: navbar scroll + reveal animations
// =========================

document.addEventListener("DOMContentLoaded", () => {
  const navbar = document.querySelector(".navbar");

  // 1) Effet "scrolled" sur la navbar
  const onScroll = () => {
    if (!navbar) return;
    if (window.scrollY > 10) navbar.classList.add("scrolled");
    else navbar.classList.remove("scrolled");
  };
  window.addEventListener("scroll", onScroll);
  onScroll();

  // 2) Ajout de la classe reveal sur les éléments qu'on veut animer
  const toReveal = [
    ".hero-content",
    ".why-section h2",
    ".feature-card",
    ".promo-content",
    ".footer .footer-column",
    ".copyright"
  ];

  const elements = toReveal
    .flatMap(sel => Array.from(document.querySelectorAll(sel)))
    .filter(Boolean);

  elements.forEach(el => el.classList.add("reveal"));

  // 3) Animation au scroll (IntersectionObserver)
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("show");
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });

  elements.forEach(el => observer.observe(el));
});