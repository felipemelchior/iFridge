import styled from 'styled-components';
import { lighten } from 'polished';

export const Container = styled.div`
  width: 100%;
  max-width: 900px;
  margin: 50px auto;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;

  button {
    width: 100px;
    height: 100px;
    background: #fff;
    margin-right: 10px;
    margin-bottom: 10px;
    font-weight: bold;
    border: 2px solid #d1191d;
    border-radius: 4px;
    transition: background 0.2s;

    &:hover {
      background: ${lighten(0.3, '#d1191d')};
    }

    span {
      color: rgba(0, 0, 0, 0.4);
    }
  }
`;

export const ProductList = styled.ul`
  border: 2px solid #d1191d;
  width: 100%;
  max-width: 900px;
  padding: 10px;
  border-radius: 4px;
  background: #fff;
`;

export const HeaderList = styled.li`
  padding: 5px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;

  p {
    width: 400px;
    font-size: 14px;
    font-weight: bold;
    color: #d1191d;
  }
`;

export const Product = styled.li`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;

  padding: 5px;

  & + li {
    border-top: 1px solid #eee;
    margin-top: 5px;
  }

  p {
    width: 400px;
    font-size: 14px;
  }

  div {
    svg {
      transition: background 0.2s;

      &:hover {
        background: ${lighten(0.3, '#d1191d')};
      }
    }
  }
`;
