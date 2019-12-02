import styled from 'styled-components';

import { darken } from 'polished';

export const Container = styled.div`
  background: #fff;
  padding: 0 30px;
`;

export const Content = styled.div`
  height: 64px;
  max-width: 900px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;

  nav {
    display: flex;
    align-items: center;

    img {
      margin-right: 20px;
      padding-right: 20px;
      border-right: 1px solid #eee;
      transition: margin-bottom 0.2s;

      &:hover {
        margin-bottom: 15px;
      }
    }

    a {
      font-weight: bold;
      color: #d1191d;
      transition: color 0.2s;

      &:hover {
        color: ${darken(0.09, '#d1191d')};
      }
    }
  }

  aside {
    display: flex;
    align-items: center;
  }
`;

export const Logo = styled.img`
  width: 60px;
  height: 60px;
`;

export const Profile = styled.div`
  display: flex;
  align-items: center;
  margin-left: 20px;
  padding-left: 1px solid #eee;

  div {
    text-align: right;
    margin-right: 10px;

    strong {
      display: block;
      color: #333;
    }

    a {
      align-self: stretch;
      margin-top: 2px;
      font-size: 12px;
      color: #999;
      transition: color 0.2s;

      &:hover {
        color: ${darken(0.2, '#999')};
      }
    }
  }

  img {
    border: 2px solid #d1191d;
    height: 38px;
    border-radius: 50%;
    transition: border 0.2s;
  }
`;
