document.addEventListener('DOMContentLoaded', function() {
    // Handle all scrollable containers
    const containers = document.querySelectorAll('.scrollable-container');
    
    containers.forEach(container => {
        const leftButton = container.querySelector('.scroll-nav-left');
        const rightButton = container.querySelector('.scroll-nav-right');
        const scrollableItems = container.querySelector('.scrollable-items');
        
        if (leftButton && rightButton && scrollableItems) {
            // Check if we should show buttons based on overflow
            if (container.classList.contains('dynamic-scroll-buttons')) {
                const hasOverflow = scrollableItems.scrollWidth > scrollableItems.clientWidth;
                leftButton.style.display = hasOverflow ? 'flex' : 'none';
                rightButton.style.display = hasOverflow ? 'flex' : 'none';
                
                // Add resize listener
                window.addEventListener('resize', function() {
                    const hasOverflowOnResize = scrollableItems.scrollWidth > scrollableItems.clientWidth;
                    leftButton.style.display = hasOverflowOnResize ? 'flex' : 'none';
                    rightButton.style.display = hasOverflowOnResize ? 'flex' : 'none';
                });
            }
            
            // Add click handlers
            leftButton.addEventListener('click', () => {
                scrollableItems.scrollBy({ left: -300, behavior: 'smooth' });
            });
            
            rightButton.addEventListener('click', () => {
                scrollableItems.scrollBy({ left: 300, behavior: 'smooth' });
            });
            
            // Enable drag to scroll
            let isDown = false;
            let startX;
            let scrollLeft;
            
            scrollableItems.addEventListener('mousedown', (e) => {
                isDown = true;
                scrollableItems.style.cursor = 'grabbing';
                startX = e.pageX - scrollableItems.offsetLeft;
                scrollLeft = scrollableItems.scrollLeft;
            });
            
            scrollableItems.addEventListener('mouseleave', () => {
                isDown = false;
                scrollableItems.style.cursor = 'grab';
            });
            
            scrollableItems.addEventListener('mouseup', () => {
                isDown = false;
                scrollableItems.style.cursor = 'grab';
            });
            
            scrollableItems.addEventListener('mousemove', (e) => {
                if (!isDown) return;
                e.preventDefault();
                const x = e.pageX - scrollableItems.offsetLeft;
                const walk = (x - startX) * 2; // Scroll speed
                scrollableItems.scrollLeft = scrollLeft - walk;
            });
        }
    });
    
    // Process elements with data-onrender attribute
    document.querySelectorAll('[data-onrender]').forEach(function(el) {
        try {
            const scriptContent = el.getAttribute('data-onrender');
            if (scriptContent) {
                new Function(scriptContent)();
            }
        } catch (e) {
            console.error('Error executing onrender script:', e);
        }
    });
}); 