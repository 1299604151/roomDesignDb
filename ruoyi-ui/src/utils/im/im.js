import Tiows from "./tiows";
import constant from "./constant";
import {  Message } from 'element-ui'
import { getToken } from '@/utils/auth'
export default function () {
  this.ws_protocol = constant.wsProtocol;
  this.ip = constant.imBaseURL;
  this.port = constant.wsPort;
  this.paramStr = 'Authorization=' + getToken();
  this.binaryType = 'blob';

  this.initWs = () => {
    this.tio = new Tiows(this.ws_protocol, this.ip, this.port, this.paramStr, this.binaryType);
    this.tio.connect();
  }

  this.disconnect = () => {
    if (this.tio && this.tio.ws) {
      this.tio.ws.close();
    }
  }

  this.sendMsg = (value) => {
    if (this.tio && this.tio.ws && this.tio.ws.readyState === 1) {
      this.tio.send(value);
      return true;
    } else {
      Message({
        message: "发送失败，请重试！",
        type: 'error'
      });
      return false;
    }
  }
}
