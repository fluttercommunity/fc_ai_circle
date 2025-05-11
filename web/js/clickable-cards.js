// Make resource-link cards fully clickable
document.addEventListener('DOMContentLoaded', function() {
  console.log('[ClickableCard] DOMContentLoaded event fired.');
  const resourceLinks = document.querySelectorAll('.resource-link');
  console.log(`[ClickableCard] Found ${resourceLinks.length} elements with class .resource-link.`);
  
  resourceLinks.forEach(function(card, index) {
    console.log(`[ClickableCard] Processing card #${index + 1}`, card);
    const titleLink = card.querySelector('a.resource-title');

    if (titleLink) {
      console.log(`[ClickableCard] Card #${index + 1}: Found titleLink:`, titleLink, `with href: ${titleLink.getAttribute('href')}`);
      const url = titleLink.getAttribute('href');
      const targetAttribute = titleLink.getAttribute('target');
      const target = targetAttribute || '_self';
      console.log(`[ClickableCard] Card #${index + 1}: URL='${url}', Target='${target}' (from attribute '${targetAttribute}')`);

      if (!url) {
        console.warn(`[ClickableCard] Card #${index + 1}: titleLink found, but href attribute is missing or empty. Card will not be fully clickable.`);
        return; // Skip adding listener if URL is invalid
      }

      card.addEventListener('click', function(event) {
        const clickedElement = event.target;
        console.log(`[ClickableCard] Card #${index + 1} clicked!`);
        console.log(`[ClickableCard]   event.target (actual clicked element):`, clickedElement);
        console.log(`[ClickableCard]   titleLink (the main <a> in this card):`, titleLink);

        // If the click target (or its closest ancestor) is an element with the class 'a.resource-title',
        // let the browser handle the navigation.
        if (clickedElement.closest('a.resource-title')) {
          console.log(`[ClickableCard]   Decision: Click was on or within a.resource-title. Allowing default browser navigation.`);
          return;
        }

        // Otherwise, the click was on the card's empty space. Navigate using JS.
        console.log(`[ClickableCard]   Decision: Click was NOT on or within a.resource-title. Attempting JS navigation to ${url}.`);
        if (target === '_blank') {
          window.open(url, '_blank');
        } else {
          window.location.href = url;
        }
      });
      // card.style.cursor = 'pointer'; // This is handled by CSS
      console.log(`[ClickableCard] Card #${index + 1}: Click listener attached.`);
    } else {
      console.warn(`[ClickableCard] Card #${index + 1}: Could not find a.resource-title within this card. It will not be fully clickable.`);
    }
  });
  console.log('[ClickableCard] Script initialization finished.');
});
