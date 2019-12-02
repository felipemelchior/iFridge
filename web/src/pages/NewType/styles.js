import styled from 'styled-components';

import { darken } from 'polished';

export const Container = styled.div`
  width: 100%;
  background: #fff;
  margin: 50px auto;
  max-width: 415px;
  border-radius: 4px;
  padding: 15px;

  h1 {
    text-align: center;
    color: rgba(0, 0, 0, 0.9);
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

  form {
    display: flex;
    flex-direction: column;

    input {
      background: rgba(0, 0, 0, 0.1);
      border: 0;
      border-radius: 4px;
      height: 44px;
      padding: 0 15px;
      margin: 0 0 10px;
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
`;
