import styled from 'styled-components';
import { lighten } from 'polished';

export const Container = styled.div`
  width: 100%;
  max-width: 900px;
  margin: 30px auto;

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

    border-top-right-radius: 20px;
    border-bottom-left-radius: 20px;

    border-top-left-radius: 10px;
    border-bottom-right-radius: 10px;

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

  border-top-right-radius: 30px;
  border-bottom-left-radius: 30px;

  border-top-left-radius: 10px;
  border-bottom-right-radius: 10px;

  background: #fff;
`;

export const HeaderList = styled.ul`
  padding: 5px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;

  li {
    font-size: 14px;
    font-weight: bold;
    color: #d1191d;
  }

  li:nth-child(2) {
    margin-left: -5px;
  }

  li:nth-child(3) {
    margin-right: 120px;
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
    width: 80px;
    font-size: 14px;
  }

  div {
    svg {
      border-radius: 5px;
      transition: background 0.2s;

      &:hover {
        background: ${lighten(0.3, '#d1191d')};
      }
    }
  }
`;
