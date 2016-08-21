import {Router, RouterConfiguration} from 'aurelia-router'

export class App {
  router: Router;
  
  configureRouter(config: RouterConfiguration, router: Router) {
    config.title = "Deaf identity and its effect on the leader-follower relationship";
    config.map([
      { route: ['','introduction'], name: 'introduction', moduleId: 'introduction', nav: false, title: 'Introduction' },
      { route: 'consentToParticipate', name: 'consentToParticipate', moduleId: 'consentToParticipate', nav: false, title: 'Acknowledge' },
      { route: 'survey', name: 'survey', moduleId: 'survey', nav: false, title: 'Choose Survey' },
      { route: 'questions/:surveyId', name: 'questions', moduleId: 'questions', title: 'Questions' }
    ]);

    this.router = router;
  }
}