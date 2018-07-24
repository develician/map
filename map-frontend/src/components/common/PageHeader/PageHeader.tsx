import * as React from 'react';
import styles from './PageHeader.scss';
import * as classNames from 'classnames/bind';

const cx = classNames.bind(styles);

// interface PageHeaderProps {
// }

const PageHeader: React.SFC<{}> = () => {
  return (
    <div className={cx('PageHeader')}>
      <div className={cx('Logo')}>MAP</div>
    </div>
  );
};

export default PageHeader;
