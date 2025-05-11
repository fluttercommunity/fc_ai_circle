import 'package:fc_ai_circle/fc_ai_circle.dart';
import 'package:jaspr/browser.dart';
import 'dart:js' as js;

void main() {
  Jaspr.initializeApp();
  runApp(Website());

  // Enhanced navigation and scroll fix for the app
  js.context.callMethod('eval', [
    '''
    (function() {
      // Reset scroll position on all navigation events
      function resetScrollPosition() {
        window.scrollTo({
          top: 0,
          left: 0,
          behavior: 'auto'
        });
      }
      
      // Apply scroll reset on page load
      document.addEventListener('DOMContentLoaded', function() {
        resetScrollPosition();
        
        // Global click handler for all link navigation
        document.addEventListener('click', function(e) {
          const link = e.target.closest('a');
          if (link) {
            const href = link.getAttribute('href');
            if (href && (href.includes('/starters') || href.includes('/builders'))) {
              // For internal links, set a flag to scroll after navigation
              window.__needsScrollReset = true;
            }
          }
        });
      });
      
      // Handle router navigation events
      const originalPushState = history.pushState;
      history.pushState = function() {
        originalPushState.apply(this, arguments);
        if (window.__needsScrollReset) {
          setTimeout(resetScrollPosition, 10);
          window.__needsScrollReset = false;
        }
      };
      
      // Handle back/forward navigation
      window.addEventListener('popstate', resetScrollPosition);
      
      // Check periodically for any scrolling issues after navigation
      // (helps catch cases where the router takes time to render)
      window.addEventListener('load', function() {
        setTimeout(resetScrollPosition, 100);
        setTimeout(resetScrollPosition, 500);
      });
      
      // Override internal router navigation to ensure scrolling works
      const checkForRouterNavigation = setInterval(function() {
        const path = window.location.pathname;
        if (path.includes('/starters') || path.includes('/builders')) {
          resetScrollPosition();
        }
      }, 200);
      
      // Clear the interval after 2 seconds (navigation should be complete by then)
      setTimeout(function() {
        clearInterval(checkForRouterNavigation);
      }, 2000);
    })();
  '''
  ]);
}
