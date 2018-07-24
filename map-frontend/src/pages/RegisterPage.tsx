import * as React from 'react';
import PageTemplate from 'components/common/PageTemplate';
import RegisterContainer from 'containers/auth/RegisterContainer';

// interface RegisterPageProps {
// }

const RegisterPage: React.SFC<{}> = () => {
  return (
    <PageTemplate background={true}>
      <RegisterContainer />
    </PageTemplate>
  );
};

export default RegisterPage;
