import * as React from 'react';
import PageTemplate from 'components/common/PageTemplate';
import LoginContainer from 'containers/auth/LoginContainer';

// interface LoginPageProps {
// }

const LoginPage: React.SFC<{}> = () => {
  return (
    <PageTemplate background={true}>
      <LoginContainer />
    </PageTemplate>
  );
};

export default LoginPage;
