import * as React from 'react';
import * as ReactDOM from 'react-dom';
import Root from './Root';
import 'styles/base.scss';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<Root />, document.getElementById('root') as HTMLElement);
registerServiceWorker();
