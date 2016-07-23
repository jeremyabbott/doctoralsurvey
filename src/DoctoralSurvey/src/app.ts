import {Router, RouterConfiguration} from 'aurelia-router'

export class App {
  router: Router;
  
  configureRouter(config: RouterConfiguration, router: Router) {
    config.title = "Deaf identity and its effect on the leader-follower relationship";
    config.map([
      { route: ['', 'questions'], name: 'questions', moduleId: 'questions', nav: true, title: 'Questions' }
    ]);

    this.router = router;
  }
}