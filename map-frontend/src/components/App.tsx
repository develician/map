import * as React from 'react';
import { Switch, Route } from 'react-router-dom';
import { Home, LoginPage, RegisterPage, NotFound } from 'pages';

// interface AppProps {
// }

const App: React.SFC<{}> = props => {
  return (
    <div>
      <Switch>
        <Route exact={true} path="/" component={Home} />
        <Route exact={true} path="/auth/register" component={RegisterPage} />
        <Route exact={true} path="/auth/login" component={LoginPage} />
        <Route component={NotFound} />
      </Switch>
    </div>
  );
};

export default App;
