// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "bootstrap-datepicker"
$('.datepicker').datepicker({ format: 'mm/dd/yyyy', startDate: '-3d' });
