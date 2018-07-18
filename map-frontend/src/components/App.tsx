import * as React from 'react';
import { Switch, Route } from 'react-router-dom';
import { Home, NotFound } from 'pages';

// interface AppProps {
// }

const App: React.SFC<{}> = props => {
  return (
    <div>
      <Switch>
        <Route exact={true} path="/" component={Home} />
        <Route component={NotFound} />
      </Switch>
    </div>
  );
};

export default App;
