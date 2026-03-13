document.addEventListener('DOMContentLoaded', () => {
    
    // Set Current Year in Footer
    const yearSpan = document.getElementById('year');
    if (yearSpan) {
        yearSpan.textContent = new Date().getFullYear();
    }

    // Navbar Scroll Effect
    const navbar = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Mobile Menu Toggle
    const hamburger = document.querySelector('.hamburger');
    const navLinks = document.querySelector('.nav-links');
    const links = document.querySelectorAll('.nav-links li a');

    if (hamburger && navLinks) {
        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            navLinks.classList.toggle('active');
        });

        // Close menu when a link is clicked
        links.forEach(link => {
            link.addEventListener('click', () => {
                hamburger.classList.remove('active');
                navLinks.classList.remove('active');
            });
        });
    }

    // Intersection Observer for scroll animations (fade-in, slide-up)
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.15
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('appear');
                observer.unobserve(entry.target); // Optional: only animate once
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in, .slide-up').forEach(element => {
        observer.observe(element);
    });

    // Portfolio Filtering
    const filterBtns = document.querySelectorAll('.filter-btn');
    const portfolioItems = document.querySelectorAll('.portfolio-item');

    // Fonction de filtrage
    function applyFilter(filterValue) {
        portfolioItems.forEach(item => {
            const itemCategory = item.getAttribute('data-category');
            if (filterValue === 'all' || itemCategory === filterValue) {
                item.style.display = 'block';
                // Re-trigger animation
                setTimeout(() => {
                    item.classList.add('appear');
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }, 10);
            } else {
                item.style.display = 'none';
                item.style.opacity = '0';
                item.style.transform = 'translateY(30px)';
            }
        });
    }

    // Appliquer le filtre par défaut au chargement (bouton actif)
    const activeBtn = document.querySelector('.filter-btn.active');
    if (activeBtn) {
        const defaultFilter = activeBtn.getAttribute('data-filter');
        applyFilter(defaultFilter);
    }

    // Gestion des clics sur les boutons de filtre
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // Remove active class from all buttons
            filterBtns.forEach(b => b.classList.remove('active'));
            // Add active class to clicked button
            btn.classList.add('active');

            const filterValue = btn.getAttribute('data-filter');
            applyFilter(filterValue);
        });
    });
});
