import request from '@/utils/request'

// 查询订单列表
export function listDsgnOrders(query) {
  return request({
    url: '/dsgn/dsgnOrders/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getDsgnOrders(id) {
  return request({
    url: '/dsgn/dsgnOrders/' + id,
    method: 'get'
  })
}

// 新增订单
export function addDsgnOrders(data) {
  return request({
    url: '/dsgn/dsgnOrders',
    method: 'post',
    data: data
  })
}

// 修改订单
export function updateDsgnOrders(data) {
  return request({
    url: '/dsgn/dsgnOrders',
    method: 'put',
    data: data
  })
}

// 删除订单
export function delDsgnOrders(id) {
  return request({
    url: '/dsgn/dsgnOrders/' + id,
    method: 'delete'
  })
}
