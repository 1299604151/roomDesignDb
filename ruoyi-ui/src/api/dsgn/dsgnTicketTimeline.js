import request from '@/utils/request'

// 查询工单时间线列表
export function listDsgnTicketTimeline(query) {
  return request({
    url: '/dsgn/dsgnTicketTimeline/list',
    method: 'get',
    params: query
  })
}

// 查询工单时间线详细
export function getDsgnTicketTimeline(id) {
  return request({
    url: '/dsgn/dsgnTicketTimeline/' + id,
    method: 'get'
  })
}

// 新增工单时间线
export function addDsgnTicketTimeline(data) {
  return request({
    url: '/dsgn/dsgnTicketTimeline',
    method: 'post',
    data: data
  })
}

// 修改工单时间线
export function updateDsgnTicketTimeline(data) {
  return request({
    url: '/dsgn/dsgnTicketTimeline',
    method: 'put',
    data: data
  })
}

// 删除工单时间线
export function delDsgnTicketTimeline(id) {
  return request({
    url: '/dsgn/dsgnTicketTimeline/' + id,
    method: 'delete'
  })
}
