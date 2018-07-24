import * as React from 'react';
import styles from './PageTemplate.scss';
import * as classNames from 'classnames/bind';
import PageHeader from '../PageHeader';
// import PageFooter from '../PageFooter';

const cx = classNames.bind(styles);

interface PageTemplateProps {
  background: boolean;
}

const PageTemplate: React.SFC<PageTemplateProps> = ({ children, background }) => {
  if (background) {
    return (
      <div className={cx('PageTemplate', 'Background')}>
        <PageHeader />
        <main>{children}</main>
        {/* <PageFooter /> */}
      </div>
    );
  }
  return (
    <div className={cx('PageTemplate')}>
      <PageHeader />
      <main>{children}</main>
      {/* <PageFooter /> */}
    </div>
  );
};

export default PageTemplate;
