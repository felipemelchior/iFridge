import styled from 'styled-components';

import { darken } from 'polished';

export const Container = styled.div`
  width: 100%;
  max-width: 415px;
  background: #fff;
  border-radius: 4px;
  margin: 50px auto;
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

    select {
      background: rgba(0, 0, 0, 0.1);
      border: 0;
      border-radius: 4px;
      height: 44px;
      padding: 0 15px;
      margin: 0 0 10px;

      option {
        background: rgba(0, 0, 0, 0.1);
        border: 0;
        border-radius: 4px;
        height: 44px;
        padding: 0 15px;
        margin: 0 0 10px;
      }
    }

    div {
      display: flex;
      align-items: center;

      svg {
        border-top-left-radius: 4px;
        border-bottom-left-radius: 4px;

        height: 44px;
        padding-left: 4px;
        background: rgba(0, 0, 0, 0.1);
        margin-bottom: 10px;
      }

      > input {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
        width: 100%;
      }
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
