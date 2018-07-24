import * as React from 'react';
import styles from './LoginForm.scss';
import * as classNames from 'classnames/bind';
import { Link } from 'react-router-dom';

const cx = classNames.bind(styles);

interface LoginFormProps {
  version: string;
  username: string;
  email: string;
  password: string;
  name: string;
  onChangeInput(e: React.ChangeEvent<HTMLInputElement>): void;
  onRegister?(): void;
}

const LoginForm: React.SFC<LoginFormProps> = ({
  version,
  username,
  email,
  password,
  name,
  onChangeInput,
  onRegister,
}) => {
  if (version === 'register') {
    return (
      <div className={cx('Wrapper')}>
        <div className={cx('Form')}>
          <div className={cx('Line')}>
            <div className={cx('Label')}>이메일 주소</div>
            <div className={cx('Input')}>
              <input type="email" name="email" value={email} onChange={onChangeInput} />
            </div>
          </div>
          <div className={cx('Line')}>
            <div className={cx('Label')}>성명</div>
            <div className={cx('Input')}>
              <input type="text" name="name" value={name} onChange={onChangeInput} />
            </div>
          </div>
          <div className={cx('Line')}>
            <div className={cx('Label')}>아이디</div>
            <div className={cx('Input')}>
              <input type="text" name="username" value={username} onChange={onChangeInput} />
            </div>
          </div>
          <div className={cx('Line')}>
            <div className={cx('Label')}>패스워드</div>
            <div className={cx('Input')}>
              <input type="password" name="password" value={password} onChange={onChangeInput} />
            </div>
          </div>
          <div className={cx('Button')} onClick={onRegister}>
            가입
          </div>
          <div className={cx('RecogLine')} />
          <Link to={'/auth/login'} className={cx('Button')}>
            MAP 로그인
          </Link>
          <div className={cx('Button')}>FaceBook으로 로그인</div>
          <div className={cx('Button')}>Naver로 로그인</div>
        </div>
      </div>
    );
  }
  return (
    <div className={cx('Wrapper')}>
      <div className={cx('Form')}>
        <div className={cx('Line')}>
          <div className={cx('Label')}>아이디</div>
          <div className={cx('Input')}>
            <input type="text" name="username" value={username} onChange={onChangeInput} />
          </div>
        </div>
        <div className={cx('Line')}>
          <div className={cx('Label')}>패스워드</div>
          <div className={cx('Input')}>
            <input type="password" name="password" value={password} onChange={onChangeInput} />
          </div>
        </div>
        <div className={cx('Button')}>로그인</div>
        <div className={cx('RecogLine')} />
        <div className={cx('Description')}>아이디 찾기</div>
        <div className={cx('Description')}>비밀번호 찾기</div>
        <Link to={`/auth/register`} className={cx('Button')}>
          가입하기
        </Link>
      </div>
    </div>
  );
};
export default LoginForm;
