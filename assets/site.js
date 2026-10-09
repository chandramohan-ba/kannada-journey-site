const tabs = document.querySelectorAll('[role="tab"]');
const panels = document.querySelectorAll('[role="tabpanel"]');

tabs.forEach((tab, index) => {
  tab.addEventListener('click', () => {
    tabs.forEach((t, i) => {
      t.setAttribute('aria-selected', i === index ? 'true' : 'false');
      panels[i].hidden = i !== index;
    });
  });
});