// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('DOMContentLoaded', function() {
  const fileInput = document.getElementById('memorie_images');
  const fileLabel = document.getElementById('file-count-label');

  fileInput.addEventListener('change', function() {
      const fileCount = fileInput.files.length;
      if (fileCount > 0) {
          fileLabel.textContent = `${fileCount} fichier${fileCount > 1 ? 's' : ''} sélectionné${fileCount > 1 ? 's' : ''}`;
      } else {
          fileLabel.textContent = 'Aucun fichier choisi';
      }
  });
});
