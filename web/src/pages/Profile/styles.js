import styled from 'styled-components';
import { darken } from 'polished';

export const Container = styled.div`
  max-width: 600px;
  margin: 30px auto;
  padding: 20px;
  background: #fff;
  border-top-right-radius: 40px;
  border-bottom-left-radius: 40px;

  border-top-left-radius: 10px;
  border-bottom-right-radius: 10px;

  form {
    display: flex;
    flex-direction: column;
    margin-top: 30px;

    input {
      background: rgba(0, 0, 0, 0.1);
      border: 0;
      border-radius: 4px;
      height: 44px;
      padding: 0 15px;
      margin: 0 0 10px;
    }

    span {
      color: #f64c75;
      align-self: flex-start;
      margin: 0 0 10px;
      font-weight: bold;
    }

    hr {
      border: 0;
      height: 2px;
      background: #d1191d;
      margin: 10px 0 20px;
    }

    button {
      margin: 5px 0 0;
      height: 44px;
      background: #3b9eff;
      font-weight: bold;
      border: 0;
      color: #fff;
      border-radius: 4px;
      font-size: 16px;
      transition: background 0.2s;

      &:hover {
        background: ${darken(0.08, '#3b9eff')};
      }
    }
  }

  > button {
    width: 100%;
    margin: 10px 0 10px;
    height: 44px;
    background: #f64c76;
    font-weight: bold;
    border: 0;
    color: #fff;
    border-radius: 4px;
    font-size: 16px;
    transition: background 0.2s;

    &:hover {
      background: ${darken(0.08, '#F64C76')};
    }
  }
`;

export const Avatar = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: center;

  img {
    background: #333;
    width: 128px;
    height: 128px;
    border-radius: 50%;
    border: 2px solid #d1191d;
    transition: border 0.2s;

    &:hover {
      border: 10px solid ${darken(0.1, '#d1191d')};
    }
  }
`;
