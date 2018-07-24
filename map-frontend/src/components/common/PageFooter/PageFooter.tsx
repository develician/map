import * as React from 'react';
import styles from './PageFooter.scss';
import * as classNames from 'classnames/bind';

const cx = classNames.bind(styles);

// interface PageFooterProps {
// }

const PageFooter: React.SFC<{}> = () => {
  return <div className={cx('PageFooter')}>PageFooter</div>;
};

export default PageFooter;
