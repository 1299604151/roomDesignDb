import request from '@/utils/request'

// 查询工单列表
export function listDsgnTickets(query) {
  return request({
    url: '/dsgn/dsgnTickets/list',
    method: 'get',
    params: query
  })
}

// 查询工单详细
export function getDsgnTickets(id) {
  return request({
    url: '/dsgn/dsgnTickets/' + id,
    method: 'get'
  })
}

// 新增工单
export function addDsgnTickets(data) {
  return request({
    url: '/dsgn/dsgnTickets',
    method: 'post',
    data: data
  })
}

// 修改工单
export function updateDsgnTickets(data) {
  return request({
    url: '/dsgn/dsgnTickets',
    method: 'put',
    data: data
  })
}

// 删除工单
export function delDsgnTickets(id) {
  return request({
    url: '/dsgn/dsgnTickets/' + id,
    method: 'delete'
  })
}
