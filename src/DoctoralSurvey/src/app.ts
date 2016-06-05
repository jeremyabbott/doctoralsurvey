import {Router, RouterConfiguration} from 'aurelia-router'

export class App {
  router: Router;
  
  configureRouter(config: RouterConfiguration, router: Router) {
    config.title = "David's Dissertation Survey";
    config.map([
      { route: ['', 'questions'], name: 'questions', moduleId: 'questions', nav: true, title: 'Questions' }
    ]);

    this.router = router;
  }
}